import { Link } from "react-router-dom";
import { Bell, Calendar, Home, LogIn, Menu, User } from "lucide-react";
import { Button } from "@/components/ui/button";
import { useState } from "react";

const Navbar = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  const [isLoggedIn, setIsLoggedIn] = useState(false); // This will be connected to auth later

  const toggleMenu = () => setIsMenuOpen(!isMenuOpen);

  return (
    <nav className="bg-white shadow-md sticky top-0 z-50">
      <div className="container mx-auto px-4 py-3">
        <div className="flex items-center justify-between">
          <div className="flex items-center space-x-2">
            <Link to="/" className="flex items-center">
              <div className="w-8 h-8 rounded-full bg-campus-primary flex items-center justify-center">
                <span className="font-bold text-white">VH</span>
              </div>
              <span className="font-bold ml-2 text-campus-primary text-xl hidden md:block">
                VITHive
              </span>
            </Link>
          </div>

          {/* Desktop Navigation */}
          <div className="hidden md:flex items-center space-x-6">
            <Link
              to="/"
              className="flex items-center space-x-1 text-campus-primary hover:text-campus-accent transition-colors"
            >
              <Home size={18} />
              <span>Home</span>
            </Link>
            <Link
              to="/calendar"
              className="flex items-center space-x-1 text-campus-primary hover:text-campus-accent transition-colors"
            >
              <Calendar size={18} />
              <span>Calendar</span>
            </Link>
            <Link
              to="/notifications"
              className="flex items-center space-x-1 text-campus-primary hover:text-campus-accent transition-colors"
            >
              <Bell size={18} />
              <span>Notifications</span>
            </Link>
          </div>

          {/* Auth Buttons */}
          <div className="hidden md:flex items-center space-x-2">
            {isLoggedIn ? (
              <Button 
                variant="ghost" 
                className="flex items-center space-x-2 text-campus-primary hover:bg-campus-secondary/40"
                onClick={() => setIsLoggedIn(false)}
              >
                <User size={18} />
                <span>Profile</span>
              </Button>
            ) : (
              <Link to="/login">
                <Button 
                  className="flex items-center space-x-2 bg-campus-primary text-white hover:bg-campus-primary/90"
                >
                  <LogIn size={18} />
                  <span>Sign In</span>
                </Button>
              </Link>
            )}
          </div>

          {/* Mobile Menu Button */}
          <div className="md:hidden">
            <Button
              variant="ghost"
              className="text-campus-primary"
              onClick={toggleMenu}
            >
              <Menu />
            </Button>
          </div>
        </div>

        {/* Mobile Menu */}
        {isMenuOpen && (
          <div className="md:hidden py-4 animate-fade-in">
            <div className="flex flex-col space-y-3">
              <Link
                to="/"
                className="flex items-center space-x-2 px-4 py-2 rounded-md hover:bg-campus-secondary/20"
                onClick={toggleMenu}
              >
                <Home size={18} />
                <span>Home</span>
              </Link>
              <Link
                to="/calendar"
                className="flex items-center space-x-2 px-4 py-2 rounded-md hover:bg-campus-secondary/20"
                onClick={toggleMenu}
              >
                <Calendar size={18} />
                <span>Calendar</span>
              </Link>
              <Link
                to="/notifications"
                className="flex items-center space-x-2 px-4 py-2 rounded-md hover:bg-campus-secondary/20"
                onClick={toggleMenu}
              >
                <Bell size={18} />
                <span>Notifications</span>
              </Link>
              {isLoggedIn ? (
                <Link
                  to="/profile"
                  className="flex items-center space-x-2 px-4 py-2 rounded-md hover:bg-campus-secondary/20"
                  onClick={toggleMenu}
                >
                  <User size={18} />
                  <span>Profile</span>
                </Link>
              ) : (
                <Link to="/login" onClick={toggleMenu}>
                  <Button 
                    className="flex items-center justify-center space-x-2 bg-campus-primary text-white hover:bg-campus-primary/90 w-full"
                  >
                    <LogIn size={18} />
                    <span>Sign In</span>
                  </Button>
                </Link>
              )}
            </div>
          </div>
        )}
      </div>
    </nav>
  );
};

export default Navbar;
